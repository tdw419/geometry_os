; DESCRIPTION: Places a green 95x111 rectangle at position (30, 125).
; PLAN: r0=30(x), r1=125(y), r2=95(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 125
LDI r2, 95
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
