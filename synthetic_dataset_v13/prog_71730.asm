; DESCRIPTION: Renders a cyan line between points (414, 53) and (346, 111).
; PLAN: r0=414(x1), r1=53(y1), r2=346(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 53
LDI r2, 346
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
