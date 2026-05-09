; DESCRIPTION: Renders a cyan line between points (33, 222) and (507, 171).
; PLAN: r0=33(x1), r1=222(y1), r2=507(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 222
LDI r2, 507
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
