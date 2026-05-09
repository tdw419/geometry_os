; DESCRIPTION: Renders a cyan line between points (82, 152) and (121, 253).
; PLAN: r0=82(x1), r1=152(y1), r2=121(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 152
LDI r2, 121
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
