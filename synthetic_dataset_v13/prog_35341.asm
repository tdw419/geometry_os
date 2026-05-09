; DESCRIPTION: Renders a cyan line between points (386, 188) and (320, 125).
; PLAN: r0=386(x1), r1=188(y1), r2=320(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 188
LDI r2, 320
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
