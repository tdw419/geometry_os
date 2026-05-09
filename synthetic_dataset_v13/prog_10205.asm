; DESCRIPTION: Places a yellow 60x77 rectangle at position (284, 106).
; PLAN: r0=284(x), r1=106(y), r2=60(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 106
LDI r2, 60
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
