; DESCRIPTION: Draws a cyan line from (260, 154) to (12, 213).
; PLAN: r0=260(x1), r1=154(y1), r2=12(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 154
LDI r2, 12
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
