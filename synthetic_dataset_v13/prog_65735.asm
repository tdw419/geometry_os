; DESCRIPTION: Places a red 46x59 rectangle at position (464, 37).
; PLAN: r0=464(x), r1=37(y), r2=46(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 37
LDI r2, 46
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
