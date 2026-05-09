; DESCRIPTION: Places a green 48x20 rectangle at position (368, 113).
; PLAN: r0=368(x), r1=113(y), r2=48(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 113
LDI r2, 48
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
