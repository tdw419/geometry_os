; DESCRIPTION: Renders a cyan box of size 17x79 starting at (307, 46).
; PLAN: r0=307(x), r1=46(y), r2=17(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 46
LDI r2, 17
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
