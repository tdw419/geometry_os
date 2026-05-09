; DESCRIPTION: Places a blue 24x90 rectangle at position (284, 77).
; PLAN: r0=284(x), r1=77(y), r2=24(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 77
LDI r2, 24
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
