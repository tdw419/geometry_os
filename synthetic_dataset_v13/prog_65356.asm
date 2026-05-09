; DESCRIPTION: Draws a cyan line from (459, 104) to (327, 128).
; PLAN: r0=459(x1), r1=104(y1), r2=327(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 104
LDI r2, 327
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
