; DESCRIPTION: Renders a cyan box of size 109x25 starting at (44, 132).
; PLAN: r0=44(x), r1=132(y), r2=109(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 132
LDI r2, 109
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
