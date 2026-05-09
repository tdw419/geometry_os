; DESCRIPTION: Draws a cyan line from (281, 90) to (79, 128).
; PLAN: r0=281(x1), r1=90(y1), r2=79(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 90
LDI r2, 79
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
