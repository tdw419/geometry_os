; DESCRIPTION: Places a red 82x120 rectangle at position (214, 95).
; PLAN: r0=214(x), r1=95(y), r2=82(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 95
LDI r2, 82
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
