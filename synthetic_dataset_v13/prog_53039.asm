; DESCRIPTION: Creates a cyan rectangular region at (113, 95) spanning 27 by 96 pixels.
; PLAN: r0=113(x), r1=95(y), r2=27(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 95
LDI r2, 27
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
