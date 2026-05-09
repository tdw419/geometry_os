; DESCRIPTION: Places a orange 56x95 rectangle at position (362, 113).
; PLAN: r0=362(x), r1=113(y), r2=56(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 113
LDI r2, 56
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
