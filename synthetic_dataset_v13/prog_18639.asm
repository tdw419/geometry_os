; DESCRIPTION: Places a green 34x63 rectangle at position (340, 28).
; PLAN: r0=340(x), r1=28(y), r2=34(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 28
LDI r2, 34
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
