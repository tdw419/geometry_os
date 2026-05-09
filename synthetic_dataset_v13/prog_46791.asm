; DESCRIPTION: Renders a red line between points (213, 245) and (245, 215).
; PLAN: r0=213(x1), r1=245(y1), r2=245(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 245
LDI r2, 245
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
