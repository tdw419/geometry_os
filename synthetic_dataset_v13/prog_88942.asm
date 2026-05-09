; DESCRIPTION: Places a red 55x45 rectangle at position (108, 174).
; PLAN: r0=108(x), r1=174(y), r2=55(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 174
LDI r2, 55
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
