; DESCRIPTION: Places a yellow 91x30 rectangle at position (384, 21).
; PLAN: r0=384(x), r1=21(y), r2=91(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 21
LDI r2, 91
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
