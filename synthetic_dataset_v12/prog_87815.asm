; DESCRIPTION: Renders a cyan line between points (46, 92) and (128, 164).
; PLAN: r0=46(x1), r1=92(y1), r2=128(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 92
LDI r2, 128
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
