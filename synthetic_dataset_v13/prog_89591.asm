; DESCRIPTION: Renders a cyan line between points (434, 128) and (283, 103).
; PLAN: r0=434(x1), r1=128(y1), r2=283(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 128
LDI r2, 283
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
