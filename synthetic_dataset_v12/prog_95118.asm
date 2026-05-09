; DESCRIPTION: Renders a green box of size 47x86 starting at (127, 112).
; PLAN: r0=127(x), r1=112(y), r2=47(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 112
LDI r2, 47
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
