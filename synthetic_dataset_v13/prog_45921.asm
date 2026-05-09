; DESCRIPTION: Places a green 120x92 rectangle at position (262, 46).
; PLAN: r0=262(x), r1=46(y), r2=120(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 46
LDI r2, 120
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
