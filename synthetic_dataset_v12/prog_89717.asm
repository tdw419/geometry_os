; DESCRIPTION: Draws a cyan line from (249, 221) to (255, 117).
; PLAN: r0=249(x1), r1=221(y1), r2=255(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 221
LDI r2, 255
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
