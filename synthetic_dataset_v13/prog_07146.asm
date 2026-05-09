; DESCRIPTION: Draws a cyan line from (23, 7) to (5, 128).
; PLAN: r0=23(x1), r1=7(y1), r2=5(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 7
LDI r2, 5
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
