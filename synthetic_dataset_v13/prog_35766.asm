; DESCRIPTION: Composite: Places a magenta dot at position (53, 203) then Creates a red rectangular region at (168, 141) spanning 24 by 82 pixels.
; PLAN: r0=53(x), r1=203(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=168(x), r6=141(y), r7=24(width), r8=82(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 203
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 168
LDI r6, 141
LDI r7, 24
LDI r8, 82
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
