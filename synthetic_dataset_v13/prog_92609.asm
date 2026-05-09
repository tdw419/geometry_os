; DESCRIPTION: Places a red 51x59 rectangle at position (294, 2).
; PLAN: r0=294(x), r1=2(y), r2=51(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 2
LDI r2, 51
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
