; DESCRIPTION: Draws a cyan line from (386, 128) to (71, 11).
; PLAN: r0=386(x1), r1=128(y1), r2=71(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 128
LDI r2, 71
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
