; DESCRIPTION: Places a green 14x98 rectangle at position (290, 113).
; PLAN: r0=290(x), r1=113(y), r2=14(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 113
LDI r2, 14
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
