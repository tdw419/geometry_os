; DESCRIPTION: Renders a cyan line between points (475, 152) and (210, 182).
; PLAN: r0=475(x1), r1=152(y1), r2=210(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 152
LDI r2, 210
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
