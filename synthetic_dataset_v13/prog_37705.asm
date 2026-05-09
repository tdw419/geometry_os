; DESCRIPTION: Creates a purple rectangular region at (450, 215) spanning 42 by 33 pixels.
; PLAN: r0=450(x), r1=215(y), r2=42(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 215
LDI r2, 42
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
