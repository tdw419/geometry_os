; DESCRIPTION: Creates a purple rectangular region at (154, 180) spanning 27 by 28 pixels.
; PLAN: r0=154(x), r1=180(y), r2=27(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 180
LDI r2, 27
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
