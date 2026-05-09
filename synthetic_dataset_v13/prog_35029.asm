; DESCRIPTION: Renders a cyan line between points (392, 253) and (69, 117).
; PLAN: r0=392(x1), r1=253(y1), r2=69(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 253
LDI r2, 69
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
