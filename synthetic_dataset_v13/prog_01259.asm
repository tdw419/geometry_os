; DESCRIPTION: Places a green 102x103 rectangle at position (245, 113).
; PLAN: r0=245(x), r1=113(y), r2=102(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 113
LDI r2, 102
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
