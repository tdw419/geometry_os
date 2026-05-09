; DESCRIPTION: Places a red 103x98 rectangle at position (394, 29).
; PLAN: r0=394(x), r1=29(y), r2=103(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 29
LDI r2, 103
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
