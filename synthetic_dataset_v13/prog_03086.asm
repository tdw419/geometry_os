; DESCRIPTION: Renders a red line between points (479, 173) and (30, 231).
; PLAN: r0=479(x1), r1=173(y1), r2=30(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 173
LDI r2, 30
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
