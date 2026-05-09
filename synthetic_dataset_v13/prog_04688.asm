; DESCRIPTION: Renders a red line between points (284, 29) and (272, 16).
; PLAN: r0=284(x1), r1=29(y1), r2=272(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 29
LDI r2, 272
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
