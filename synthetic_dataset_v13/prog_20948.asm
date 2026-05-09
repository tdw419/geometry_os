; DESCRIPTION: Renders a cyan line between points (284, 56) and (326, 224).
; PLAN: r0=284(x1), r1=56(y1), r2=326(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 56
LDI r2, 326
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
