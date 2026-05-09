; DESCRIPTION: Renders a cyan line between points (488, 230) and (392, 208).
; PLAN: r0=488(x1), r1=230(y1), r2=392(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 230
LDI r2, 392
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
