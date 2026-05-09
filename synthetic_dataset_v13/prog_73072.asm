; DESCRIPTION: Renders a purple box of size 52x44 starting at (392, 46).
; PLAN: r0=392(x), r1=46(y), r2=52(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 46
LDI r2, 52
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
