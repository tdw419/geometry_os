; DESCRIPTION: Renders a green box of size 55x64 starting at (350, 54).
; PLAN: r0=350(x), r1=54(y), r2=55(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 54
LDI r2, 55
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
