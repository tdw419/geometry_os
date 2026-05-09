; DESCRIPTION: Places a green 24x91 rectangle at position (271, 83).
; PLAN: r0=271(x), r1=83(y), r2=24(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 83
LDI r2, 24
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
