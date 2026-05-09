; DESCRIPTION: Places a red 103x44 rectangle at position (262, 200).
; PLAN: r0=262(x), r1=200(y), r2=103(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 200
LDI r2, 103
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
