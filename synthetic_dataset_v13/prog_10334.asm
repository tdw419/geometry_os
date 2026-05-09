; DESCRIPTION: Draws a cyan line from (179, 140) to (206, 213).
; PLAN: r0=179(x1), r1=140(y1), r2=206(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 140
LDI r2, 206
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
