; DESCRIPTION: Places a red 46x52 rectangle at position (396, 150).
; PLAN: r0=396(x), r1=150(y), r2=46(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 150
LDI r2, 46
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
