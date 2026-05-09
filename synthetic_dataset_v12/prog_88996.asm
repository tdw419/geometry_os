; DESCRIPTION: Draws a cyan line from (8, 104) to (196, 228).
; PLAN: r0=8(x1), r1=104(y1), r2=196(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 104
LDI r2, 196
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
