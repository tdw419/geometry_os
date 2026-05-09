; DESCRIPTION: Draws a cyan line from (87, 68) to (213, 126).
; PLAN: r0=87(x1), r1=68(y1), r2=213(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 68
LDI r2, 213
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
