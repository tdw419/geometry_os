; DESCRIPTION: Places a green 82x48 rectangle at position (271, 129).
; PLAN: r0=271(x), r1=129(y), r2=82(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 129
LDI r2, 82
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
