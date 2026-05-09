; DESCRIPTION: Places a red 84x39 rectangle at position (275, 95).
; PLAN: r0=275(x), r1=95(y), r2=84(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 95
LDI r2, 84
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
