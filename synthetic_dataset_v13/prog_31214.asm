; DESCRIPTION: Places a red 61x92 rectangle at position (387, 95).
; PLAN: r0=387(x), r1=95(y), r2=61(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 95
LDI r2, 61
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
