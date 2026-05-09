; DESCRIPTION: Draws a green line from (209, 168) to (228, 235).
; PLAN: r0=209(x1), r1=168(y1), r2=228(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 168
LDI r2, 228
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
