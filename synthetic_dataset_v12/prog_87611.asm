; DESCRIPTION: Draws a white line from (104, 231) to (305, 228).
; PLAN: r0=104(x1), r1=231(y1), r2=305(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 231
LDI r2, 305
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
