; DESCRIPTION: Places a cyan 80x92 rectangle at position (262, 117).
; PLAN: r0=262(x), r1=117(y), r2=80(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 117
LDI r2, 80
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
