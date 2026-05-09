; DESCRIPTION: Draws a cyan line from (53, 191) to (281, 99).
; PLAN: r0=53(x1), r1=191(y1), r2=281(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 191
LDI r2, 281
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
