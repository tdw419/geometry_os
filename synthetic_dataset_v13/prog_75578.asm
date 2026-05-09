; DESCRIPTION: Renders a red line between points (479, 107) and (474, 219).
; PLAN: r0=479(x1), r1=107(y1), r2=474(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 107
LDI r2, 474
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
